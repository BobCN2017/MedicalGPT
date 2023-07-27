import json

input_file = 'train.tsv'
output_file = 'output.json'

with open(input_file, 'w',encoding="utf8") as file:
    with open(output_file, 'r',encoding="utf8") as outfile:
        for line in outfile:
            line = line.strip()
            json_data = json.loads(line)
            data = '\t'.join([json_data.get('instruction', ''), json_data.get('output', '')])
            file.write(data + '\n')
