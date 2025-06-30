mkdir -p compressed

for file in *.mp4 *.MP4; do
  # 确保文件存在（防止通配符找不到匹配时报错）
  [ -e "$file" ] || continue
  ffmpeg -i "$file" -vcodec libx264 -crf 28 -preset fast -c:a aac -b:a 96k "compressed/$file"
done
