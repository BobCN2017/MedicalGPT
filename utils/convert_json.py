import json

input_file = 'data/backup/granvia问题.txt'
output_file = 'output.json'

prefix = ["说一下{}", "什么是{}", "介绍一下{}", "{}是什么", "{}含义是什么", "{}怎么说", "说说{}", "解释一下{}"]

with open(input_file, 'r', encoding="utf8") as file:
    with open(output_file, 'w', encoding="utf8") as outfile:
        for line in file:
            line = line.strip()
            data = line.split('{|}')
            if len(data) < 2:
                continue
            for p in prefix:
                json_data = {
                    'instruction': p.format(data[0]),
                    'output': data[1],
                    'input': ""
                }
                json.dump(json_data, outfile, ensure_ascii=False)
                outfile.write('\n')
