function compress_video --description 'Compress video using AV1 (auto-deinterlace)'
    for f in $argv
        set -l det (ffmpeg -hide_banner -i "$f" -vf idet -frames:v 500 -f null - 2>&1 | string match -r 'Multi frame detection.*')
        set -l vf_args
        if test (count $det) -eq 1
            set -l tff (string match -rg 'TFF: *([0-9]+)' -- $det || echo 0)
            set -l bff (string match -rg 'BFF: *([0-9]+)' -- $det || echo 0)
            set -l prog (string match -rg 'Progressive: *([0-9]+)' -- $det || echo 0)
            if test (math $tff + $bff) -gt $prog
                echo "$f: interlaced, deinterlacing"
                set vf_args -vf bwdif
            else
                echo "$f: progressive, encoding as-is"
            end
        else
            echo "$f: detection failed, encoding without filter"
        end
        ffmpeg -i "$f" $vf_args -c:v libsvtav1 -crf 14 -b:v 0 -preset 4 -c:a copy "$f.mkv"
    end
end
