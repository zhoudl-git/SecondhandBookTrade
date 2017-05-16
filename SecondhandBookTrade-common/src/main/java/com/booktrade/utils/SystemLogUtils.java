package com.booktrade.utils;

import java.lang.reflect.Array;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

public class SystemLogUtils {
	private static SystemLogUtils SystemLog = null;
    private Logger logger = null;

    public SystemLogUtils(String configPath) {
        PropertyConfigurator.configure(configPath);
        // this.logger = Logger.getRootLogger();
        this.logger = Logger.getLogger(SystemLogUtils.class);
    }

    public static SystemLogUtils getSystemLog() {
        if (SystemLog == null) {
            SystemLog = new SystemLogUtils("config/log4j.properties");
        }
        return SystemLog;
    }

    public void debug(String str) {
        SystemLog.logger.debug(str);
    }

    public void info(String str) {
        SystemLog.logger.info(str);
    }

    public void warn(String str) {
        SystemLog.logger.warn(str);
    }

    public void error(String str) {
        SystemLog.logger.error(str);
    }

    public void fatal(String str) {
        SystemLog.logger.fatal(str);
    }

    public static void main(String[] args) {
        // 测试字符串
         //testString();

        // 测试数组
         Object[] array = new Object[] { "测试array", "测试array1", "测试array2" };
         testArray(array);

        // 测试List集合
        // //List放的是字符串
        // List<String> list = new ArrayList<String>();
        // list.add("测试list1");
        // list.add("测试list2");
        // list.add("测试list3");
        // //List放的是对象。
        // List<Student> list = new ArrayList<Student>();
        // for (int i = 0; i < 3; i++) {
        // Student s = new Student();
        // s.setId(i);
        // s.setName("name"+i);
        // list.add(s);
        // }
        // testList(list);

        //测试map集合
        /*Map<Teacher, Student> map = new HashMap<Teacher, Student>();
        for (int i = 0; i < 3; i++) {
            Teacher t = new Teacher();
            t.setId(i);
            t.setName("teacher"+i);
            Student s = new Student();
            s.setId(i);
            s.setName("student"+i);
            map.put(t, s);
        }*/
        //testMap(map);
    }

	public static void testString() {
    	SystemLogUtils SystemLog = SystemLogUtils.getSystemLog();
        String debug = "debug信息";
        String warn = "warn信息";
        String info = "info信息";
        String error = "error信息";
        String fatal = "fatal信息";
        SystemLog.debug(debug);
        SystemLog.warn(warn);
        SystemLog.info(info);
        SystemLog.error(error);
        SystemLog.fatal(fatal);
    }
    public static void testArray(Object[] array) {
    	SystemLogUtils SystemLog = SystemLogUtils.getSystemLog();
        int length = array.length;
        for (int i = 0; i < length; i++) {
            // System.out.println("第"+i+"号元素的值："+Array.get(array, i));
            SystemLog.debug("第" + i + "号元素的值：" + Array.get(array, i));
        }
    }

    public static <T> void testList(List<T> list) {
    	SystemLogUtils SystemLog = SystemLogUtils.getSystemLog();
        if (list == null) {
            SystemLog.error("list=null");
        } else if (list.size() == 0) {
            SystemLog.info("list.size()为0");
        } else {
            StringBuffer sb = new StringBuffer();
            String s = new String("list中数据个数：" + list.size());
            sb.append("\r\n" + s + "\r\nstart:----------------------\r\n");
            for (T t : list) {
                sb.append(t.toString() + "\r\n");// 这里List包含的类要有自定义的toString方法
            }
            sb.append("end----------------------\r\n");
            SystemLog.debug(sb.toString());
        }
    }

    public static <V, K> void testMap(Map<K, V> map) {
        // Map<Student, Student> mapTemp = new HashMap<Student, Student>();
    	SystemLogUtils SystemLog = SystemLogUtils.getSystemLog();
        if (map == null) {
            SystemLog.error("map=null");
        } else if (map.size() == 0) {
            SystemLog.info("map.size()为0");
        } else {
            StringBuffer sb = new StringBuffer();
            String s = new String("map中数据个数：" + map.size());
            sb.append("\r\n" + s + "\r\nstart:----------------------\r\n");
            for (K k : map.keySet()) {
                sb.append("key[" + k.toString() + "]所对应的value:["
                        + map.get(k).toString() + "]\r\n");// 这里List包含的类要有自定义的toString方法
            }
            sb.append("end----------------------\r\n");
            SystemLog.debug(sb.toString());
        }
    }

    public static void test2() {
        PropertyConfigurator.configure("config/log4j.properties");
        // Logger logger = Logger.getLogger(Log4jTest1.class);
        Logger logger = Logger.getRootLogger();
        // for (int i = 0; i < 1000; i++) {
        logger.debug("debug");
        logger.info("info");
        logger.error("error");
        // }
    }
}
