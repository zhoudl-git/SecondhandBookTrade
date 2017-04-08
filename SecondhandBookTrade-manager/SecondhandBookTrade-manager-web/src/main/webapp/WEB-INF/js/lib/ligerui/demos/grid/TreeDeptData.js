var TreeDeptData = { Rows : [
        { id: '01', name: "企划部",   remark: "1989-01-12",
            children: [
            { id: '0101', name: "企划分部一", remark: "企划分部一"
            },
            { id: '0102', name: "企划分部二", remark: "企划分部二", children:
                [
                    {
                        id: '010201', name: "企划分部二 A组", remark: "企划分部二 A组", children:
                        [
                            { id: '01020101', name: "企划分部二 A组1分队", remark: "企划分部二 A组1分队" },
                            { id: '01020102', name: "企划分部二 A组2分队", remark: "企划分部二 A组2分队" }
                        ]
                    },
                    { id: '010202', name: "企划分部二 B组", remark: "企划分部二 B组" }
                ]
            },
            { id: '0103', name: "企划分部三", remark: "企划分部三" }
        ]
        },
        { id: '02', name: "研发部", remark: "研发部" },
        { id: '03', name: "产品部", remark: "产品部" }  
    ]  
};