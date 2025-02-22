function compress_video --description 'Compress video using libx265'
    for f in $argv
        ffmpeg -i "$f" -vcodec libx265 -crf 30 "$f.mp4"
    end
end
