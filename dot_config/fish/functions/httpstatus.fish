function httpstatus --argument code --description 'Get the description of an HTTP status code'
    if test -z "$code"
        echo 'Usage: httpstatus <status code>'
        return 1
    end

    curl --silent "https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/$code" | htmlq --text '.main-page-content > .section-content' | sed -e 's/  //g'
end
