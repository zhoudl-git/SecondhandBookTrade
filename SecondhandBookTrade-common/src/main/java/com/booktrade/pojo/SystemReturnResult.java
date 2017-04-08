package com.booktrade.pojo;

import java.util.List;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

/**   
 * @ClassName:  SystemReturnResult   
 * @Description: 系统自定义响应结构   
 * @author: zhoudl  
 * @date:   2017年4月8日 下午1:20:55   
 *      
 */  
public class SystemReturnResult {
	// 定义jackson对象
    private static final ObjectMapper MAPPER = new ObjectMapper();

    // 响应业务状态
    private Integer status;

    // 响应消息
    private String msg;

    // 响应中的数据
    private Object data;

    public static SystemReturnResult build(Integer status, String msg, Object data) {
        return new SystemReturnResult(status, msg, data);
    }

    public static SystemReturnResult ok(Object data) {
        return new SystemReturnResult(data);
    }

    public static SystemReturnResult ok() {
        return new SystemReturnResult(null);
    }

    public SystemReturnResult() {

    }

    public static SystemReturnResult build(Integer status, String msg) {
        return new SystemReturnResult(status, msg, null);
    }

    public SystemReturnResult(Integer status, String msg, Object data) {
        this.status = status;
        this.msg = msg;
        this.data = data;
    }

    public SystemReturnResult(Object data) {
        this.status = 200;
        this.msg = "OK";
        this.data = data;
    }

//    public Boolean isOK() {
//        return this.status == 200;
//    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
    
    /**   
     * @Title: formatToPojo   
     * @Description: 将json结果集转化为SystemReturnResult对象   
     * @param: @param jsonData
     * @param: @param clazz SystemReturnResult中的object类型
     * @param: @return      
     * @return: SystemReturnResult      
     * @throws   
     */  
    public static SystemReturnResult formatToPojo(String jsonData, Class<?> clazz) {
        try {
            if (clazz == null) {
                return MAPPER.readValue(jsonData, SystemReturnResult.class);
            }
            JsonNode jsonNode = MAPPER.readTree(jsonData);
            JsonNode data = jsonNode.get("data");
            Object obj = null;
            if (clazz != null) {
                if (data.isObject()) {
                    obj = MAPPER.readValue(data.traverse(), clazz);
                } else if (data.isTextual()) {
                    obj = MAPPER.readValue(data.asText(), clazz);
                }
            }
            return build(jsonNode.get("status").intValue(), jsonNode.get("msg").asText(), obj);
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * 没有object对象的转化
     * 
     * @param json
     * @return
     */
    public static SystemReturnResult format(String json) {
        try {
            return MAPPER.readValue(json, SystemReturnResult.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Object是集合转化
     * 
     * @param jsonData json数据
     * @param clazz 集合中的类型
     * @return
     */
    public static SystemReturnResult formatToList(String jsonData, Class<?> clazz) {
        try {
            JsonNode jsonNode = MAPPER.readTree(jsonData);
            JsonNode data = jsonNode.get("data");
            Object obj = null;
            if (data.isArray() && data.size() > 0) {
                obj = MAPPER.readValue(data.traverse(),
                        MAPPER.getTypeFactory().constructCollectionType(List.class, clazz));
            }
            return build(jsonNode.get("status").intValue(), jsonNode.get("msg").asText(), obj);
        } catch (Exception e) {
            return null;
        }
    }
}
