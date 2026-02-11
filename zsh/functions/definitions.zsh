define () {
  lynx -dump "http://www.google.com/search?hl=en&q=define%3A+${1}" | grep -m 25 -w "*" | sed 's/;/ -/g' | cut -d- -f5 > /tmp/templookup.txt
    if [[ -s /tmp/templookup.txt ]] ; then
      until ! read response
}
