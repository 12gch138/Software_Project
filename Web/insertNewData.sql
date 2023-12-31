INSERT INTO `会员`(客户编号, 客户姓名, 联系方式) VALUES (5, '郭笑若', '13502545492');

INSERT INTO `会员`(客户编号, 客户姓名, 联系方式) VALUES (6, '翁存亭', '18399737062');

INSERT INTO `会员`(客户编号, 客户姓名, 联系方式) VALUES (7, '杜诗影', '13926783926');

INSERT INTO `会员`(客户编号, 客户姓名, 联系方式) VALUES (8, '梅畅珏', '17826634283');

insert into
    `供应商`(供应商名称, 联系人, 联系方式, 所在城市)
values (
        "广东罗浮山国药股份有限公司",
        "吴女生",
        "78136653256",
        "中国"
    );

insert into
    `供应商`(供应商名称, 联系人, 联系方式, 所在城市)
values (
        "山西云鹏制药有限公司",
        "吴先生",
        "29148863661",
        "中国"
    );

insert into
    `供应商`(供应商名称, 联系人, 联系方式, 所在城市)
values (
        "河北医科大学制药厂",
        "邹女士",
        "16922810828",
        "中国"
    );

insert into
    `供应商`(供应商名称, 联系人, 联系方式, 所在城市)
values (
        "宁夏康亚药业有限公司",
        "吴女生",
        "59624659601",
        "中国"
    );

insert into
    `供应商`(供应商名称, 联系人, 联系方式, 所在城市)
values (
        "山西津华晖星制药有限公司",
        "黄先生",
        "65930163918",
        "中国"
    );

insert into
    `供应商`(供应商名称, 联系人, 联系方式, 所在城市)
values (
        "浙江亚太药业股份有限公司",
        "吴女生",
        "53839375722",
        "中国"
    );

insert into
    `供应商`(供应商名称, 联系人, 联系方式, 所在城市)
values (
        "成都地奥制药集团有限公司",
        "黄先生",
        "36096149926",
        "中国"
    );

insert into
    `供应商`(供应商名称, 联系人, 联系方式, 所在城市)
values (
        "海南普利制药股份有限公司",
        "黄女士",
        "24154607707",
        "中国"
    );

insert into
    `供应商`(供应商名称, 联系人, 联系方式, 所在城市)
values (
        "鲁南厚普制药有限公司",
        "邹先生",
        "35160499869",
        "中国"
    );

insert into
    `供应商`(供应商名称, 联系人, 联系方式, 所在城市)
values (
        "青海晶珠藏药高新技术产业股份有限公司",
        "吴女生",
        "13563523730",
        "中国"
    );

insert into `登录用户`(用户名,密码,类别)values("孟柳宝","123",1);

insert into `登录用户`(用户名,密码,类别)values("凌喜欣","123",1);

insert into `登录用户`(用户名,密码,类别)values("孟柯印","123",1);

insert into `登录用户`(用户名,密码,类别)values("计钧澄","123",1);

insert into `登录用户`(用户名,密码,类别)values("吉曦崇","123",1);

insert into `员工`(员工姓名,联系电话,用户编号)values("孟柳宝","15744898482",6);

insert into `员工`(员工姓名,联系电话,用户编号)values("凌喜欣","17221022137",7);

insert into `员工`(员工姓名,联系电话,用户编号)values("孟柯印","18220069372",8);

insert into `员工`(员工姓名,联系电话,用户编号)values("计钧澄","18334207584",9);

insert into `员工`(员工姓名,联系电话,用户编号)values("吉曦崇","15721169127",10);

INSERT into
    `药品` (
        药品编号,
        药品名称,
        供应商编号,
        生产批号,
        产地,
        所属类别,
        进价,
        单价,
        会员折扣,
        库存,
        包装规格,
        生产日期,
        有效期
    )
values (
        1,
        '头孢氨苄胶囊',
        5,
        '国药准字H44022415',
        '中国',
        '化学药品',
        20,
        30,
        0.6,
        20,
        '0.125g(按C16H17N3O4S计)',
        '2020-08-06',
        '2024-08-06'
    );

INSERT into
    `药品` (
        药品编号,
        药品名称,
        供应商编号,
        生产批号,
        产地,
        所属类别,
        进价,
        单价,
        会员折扣,
        库存,
        包装规格,
        生产日期,
        有效期
    )
values (
        2,
        '云鹏硝酸异山梨酯片',
        6,
        '国药准字H14020799',
        '中国',
        '化学药品',
        15,
        20,
        0.8,
        10,
        '5mg*100片, 5mg*100片/瓶',
        '2021-08-06',
        '2028-08-06'
    );

INSERT into
    `药品` (
        药品编号,
        药品名称,
        供应商编号,
        生产批号,
        产地,
        所属类别,
        进价,
        单价,
        会员折扣,
        库存,
        包装规格,
        生产日期,
        有效期
    )
values (
        3,
        '单硝酸异山梨酯缓释片',
        7,
        '国药准字H19990137',
        '中国',
        '化学药品',
        15,
        30,
        0.8,
        100,
        '40mg*14片, 40mg*14片',
        '2021-09-04',
        '2028-08-09'
    );

INSERT into
    `药品` (
        药品编号,
        药品名称,
        供应商编号,
        生产批号,
        产地,
        所属类别,
        进价,
        单价,
        会员折扣,
        库存,
        包装规格,
        生产日期,
        有效期
    )
values (
        4,
        '圣畅吲达帕胺缓释片',
        8,
        '国药准字H20051896',
        '中国',
        '化学药品',
        30,
        39,
        0.9,
        100,
        '1.5mg*12片, 1.5mg*12片/盒',
        '2020-09-04',
        '2025-10-09'
    );

INSERT into
    `药品` (
        药品编号,
        药品名称,
        供应商编号,
        生产批号,
        产地,
        所属类别,
        进价,
        单价,
        会员折扣,
        库存,
        包装规格,
        生产日期,
        有效期
    )
values (
        5,
        '盐酸氟桂利嗪胶囊',
        9,
        '国药准字H14020126',
        '中国',
        '化学药品',
        30,
        39,
        0.9,
        109,
        '5mg*60粒, 5mg*60粒/瓶',
        '2020-09-04',
        '2025-10-09'
    );

INSERT into
    `药品` (
        药品编号,
        药品名称,
        供应商编号,
        生产批号,
        产地,
        所属类别,
        进价,
        单价,
        会员折扣,
        库存,
        包装规格,
        生产日期,
        有效期
    )
values (
        6,
        '齐迈星(阿奇霉素分散片)',
        10,
        '国药准字H10980289',
        '中国',
        '化学药品',
        19,
        39,
        0.79,
        109,
        '0.25g*6片, 0.25g*6片/盒',
        '2020-09-04',
        '2025-10-09'
    );

INSERT into
    `药品` (
        药品编号,
        药品名称,
        供应商编号,
        生产批号,
        产地,
        所属类别,
        进价,
        单价,
        会员折扣,
        库存,
        包装规格,
        生产日期,
        有效期
    )
values (
        7,
        '地奥心血康胶囊',
        10,
        '国药准字Z10910051',
        '中国',
        '化学药品',
        18,
        39,
        0.78,
        109,
        '0.1g*20粒, 0.1g*20粒/盒',
        '2022-09-04',
        '2025-08-31'
    );

INSERT into
    `药品` (
        药品编号,
        药品名称,
        供应商编号,
        生产批号,
        产地,
        所属类别,
        进价,
        单价,
        会员折扣,
        库存,
        包装规格,
        生产日期,
        有效期
    )
values (
        8,
        '赛美欣(甲砜霉素颗粒)',
        11,
        '国药准字H10950102',
        '中国',
        '化学药品',
        10,
        29,
        0.7,
        109,
        '50g:0.25g，20袋, 5.0g:0.25g，20袋',
        '2019-09-04',
        '2025-08-31'
    );

INSERT into
    `药品` (
        药品编号,
        药品名称,
        供应商编号,
        生产批号,
        产地,
        所属类别,
        进价,
        单价,
        会员折扣,
        库存,
        包装规格,
        生产日期,
        有效期
    )
values (
        9,
        '启达通心通口服液',
        11,
        '国药准字Z10920014',
        '中国',
        '化学药品',
        11,
        29,
        0.75,
        109,
        '10ml*6支, 10ml*6支/盒',
        '2022-09-04',
        '2025-08-31'
    );

INSERT into
    `药品` (
        药品编号,
        药品名称,
        供应商编号,
        生产批号,
        产地,
        所属类别,
        进价,
        单价,
        会员折扣,
        库存,
        包装规格,
        生产日期,
        有效期
    )
values (
        10,
        '芎香通脉滴丸',
        11,
        '国药准字Z20025234',
        '中国',
        '化学药品',
        15,
        29,
        0.95,
        1,
        '30mg*80丸*2瓶, 30mg*80丸*2瓶/盒',
        '2022-09-04',
        '2025-08-31'
    );

INSERT into
    `药品` (
        药品编号,
        药品名称,
        供应商编号,
        生产批号,
        产地,
        所属类别,
        进价,
        单价,
        会员折扣,
        库存,
        包装规格,
        生产日期,
        有效期
    )
values (
        11,
        '亮洛(头孢克洛胶囊)',
        11,
        '国药准字H20059058',
        '中国',
        '化学药品',
        10,
        29,
        0.95,
        1,
        '0.25g*6粒, 0.25g*6粒/盒',
        '2022-12-04',
        '2025-08-31'
    );

INSERT INTO
    `财政收支`(收支编号, 药品编号, 员工编号, 数量, 日期, 总额, 类型)
VALUES (
        1,
        1,
        6,
        1,
        '2020-11-05 20:29:36',
        30,
        '出售'
    );

INSERT INTO
    `财政收支`(收支编号, 药品编号, 员工编号, 数量, 日期, 总额, 类型)
VALUES (
        2,
        2,
        7,
        2,
        '2021-12-05 21:29:36',
        40,
        '出售'
    );

INSERT INTO
    `财政收支`(收支编号, 药品编号, 员工编号, 数量, 日期, 总额, 类型)
VALUES (
        3,
        2,
        7,
        1,
        '2021-12-05 21:40:36',
        20,
        '出售'
    );

INSERT INTO
    `财政收支`(收支编号, 药品编号, 员工编号, 数量, 日期, 总额, 类型)
VALUES (
        4,
        6,
        3,
        1,
        '2022-11-05 09:40:36',
        39,
        '出售'
    );

INSERT INTO
    `财政收支`(收支编号, 药品编号, 员工编号, 数量, 日期, 总额, 类型)
VALUES (
        5,
        1,
        7,
        10,
        '2020-11-05 09:40:36',
        200,
        '进货'
    );

INSERT INTO
    `财政收支`(收支编号, 药品编号, 员工编号, 数量, 日期, 总额, 类型)
VALUES (
        8,
        2,
        7,
        10,
        '2022-09-05 09:40:36',
        150,
        '进货'
    );

INSERT INTO
    `财政收支`(收支编号, 药品编号, 员工编号, 数量, 日期, 总额, 类型)
VALUES (
        9,
        6,
        7,
        10,
        '2022-10-05 10:40:36',
        390,
        '进货'
    );

INSERT INTO
    `财政收支`(收支编号, 药品编号, 员工编号, 数量, 日期, 总额, 类型)
VALUES (
        10,
        6,
        7,
        1,
        '2022-10-05 10:40:36',
        39,
        '退货'
    );

INSERT INTO
    `财政收支`(收支编号, 药品编号, 员工编号, 数量, 日期, 总额, 类型)
VALUES (
        11,
        7,
        7,
        1,
        '2022-10-18 10:40:36',
        39,
        '退货'
    );

INSERT INTO `销售管理`(销售编号, 客户编号, 收支编号) VALUES (1, 1, 1);

INSERT INTO `销售管理`(销售编号, 客户编号, 收支编号) VALUES (2, 3, 2);

INSERT INTO `销售管理`(销售编号, 客户编号, 收支编号) VALUES (3, 4, 3);

INSERT INTO `销售管理`(销售编号, 客户编号, 收支编号) VALUES (4, 4, 4);

INSERT INTO `销售管理`(销售编号, 客户编号, 收支编号) VALUES (5, 5, 5);

INSERT into `退货管理`( 退货编号, 销售编号, 收支编号) VALUES(1, 5, 10);

INSERT into `退货管理`( 退货编号, 销售编号, 收支编号) VALUES(2, 4, 11);