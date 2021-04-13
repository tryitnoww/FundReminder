#!/bin/bash
# 模拟环境变量
content=""

echo $Bark

for file in ./*
do
	if [[ "${file##*.}" = "json" ]]; then
		# get fund info
		code=`cat "$file" | jq .code | sed 's/\"//g'`
		cost=`cat "$file" | jq .cost`
		name=`cat "$file" | jq .name | sed 's/\"//g'`
		# get gsz
		gsz=`curl "http://fundgz.1234567.com.cn/js/$code.js" | grep -o "{.*}" | jq .gsz | sed 's/\"//g'`
		if [[ $gsz < $cost ]]; then
			content="$content;$name:V"
		else
			syl=`bc<<EOF
scale=2
($gsz-$cost)/$cost*100
EOF
`
			content="$content;$name:A$syl%25"
		fi
	fi
done

content=${content:1}
echo "https://api.day.app/$Bark/基金提醒/$content" 
