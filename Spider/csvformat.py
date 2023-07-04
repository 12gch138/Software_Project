import csv


csvlist=[]
rowname=["药品名称"]
rowname2=["相关疾病"]
rowname3=["英文名","批准文号","规格","包装","用法用量","医保","剂型",
        "外用药","国家/地区","生产企业","有效期","性状","分类"          
        ]

rowname4=["主要成份","不良反应",
        "禁忌","注意事项","儿童用药","老人用药","药物相互作用",
        "药物过量","药物毒理","药代动力学","贮藏"]
'''
rowname3=["药品名称","相关疾病","英文名称","批准文号","规格",
        "包装","用法用量","类型","医保级别","剂型",
        "外用药","国家/地区","生产企业","主要成分","不良反应",
        "禁忌","注意事项","儿童用药","老人用药","药物相互作用",
        "药物过量","药物毒理","药物动力学","贮藏"]'''
tablecolumn=[]
tablecolumn2=[]
for index in enumerate(rowname3):
    tablecolumn.append([])
for index in enumerate(rowname4):
    tablecolumn2.append([])

with open("test.csv", "r", encoding="utf-8") as f:
    reader = csv.reader(f)
    for row in reader:

    
        csvlist.append(row)
csvlist=csvlist[1:]
newcolumn2=[]
for index in range(len(csvlist)):
    diseases=csvlist[index][3].split()
    tempdis=""
    for key in diseases:
        if key[1]!='h' and key[-1]==',':
            key=key[1:-2]
            tempdis+=key+","
    tempdis=tempdis[:-1]
    newcolumn2.append(str(tempdis))


'''
with open('newcolumn2.csv', 'w', newline='',encoding='utf-8') as f:
    writer = csv.writer(f)
    for key in newcolumn2:
        writer.writerow([key])
        #len(#csvlist[1:])
 '''
for i in range(len(csvlist)):

    productname=csvlist[i][4].split()
    flag=0
    nameindex=0
    
    for index,key in enumerate(productname):
        key=key.strip(",")
        key=key.strip("'")
        key=key.strip(":")
        key=key.strip("'")
        key=key.strip("}")
        key=key.strip("{")
        productname[index]=key.strip("'")
        #print(key)
    #print(productname)
    for index,key in enumerate(rowname3):
        #print(key)
        if key in productname:
            tablecolumn[index].append(productname[productname.index(key)+1])
        else:    
            tablecolumn[index].append("未知")
for i in range(len(csvlist)):

    productname=csvlist[i][5].split()
    flag=0
    nameindex=0
    
    for index,key in enumerate(productname):
        key=key.strip(",")
        key=key.strip("'")
        key=key.strip(":")
        key=key.strip("'")
        key=key.strip("}")
        key=key.strip("{")
        productname[index]=key.strip("'")
        #print(key)
    #print(productname)
    for index,key in enumerate(rowname4):
        #print(key)
        if key in productname:
            tablecolumn2[index].append(productname[productname.index(key)+1])
        else:    
            tablecolumn2[index].append("未知")

#写新数据
with open('newtest.csv', 'w', newline='',encoding='utf-8') as f:
    writer = csv.writer(f)
    writer.writerow(rowname+rowname2+rowname3+rowname4)
    for index in range(len(csvlist)):
        row=[]
        for i in range(len(rowname)):
            row.append(csvlist[index][2])
        for i in range(len(rowname2)):
            row.append(newcolumn2[index])
        for i in range(len(rowname3)):
            row.append(tablecolumn[i][index])
        for i in range(len(rowname4)):
            row.append(tablecolumn2[i][index])
        writer.writerow(row)
