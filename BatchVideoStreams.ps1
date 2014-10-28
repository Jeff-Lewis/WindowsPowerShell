###
# ffmpeg -i "URL|FILE" -c:v copy -strict experimental "FILE"
# – <= &ndash;
# Use on NAS
# ffmpeg -i "http://svtplay10r-f.akamaihd.net/i/se/open/20130803/1128492-039A/IN_THE_NIGHT_GA-039A-968f11ea12a8bfd9_,900,348,564,1680,2800,.mp4.csmil/index_4_av.m3u8?null=&id=" -c copy -bsf:a aac_adtstoasc "/share/MD0_DATA/Multimedia/TV/2013-08-06.mp4"
# ffmpeg -i "http://svtplay1c-f.akamaihd.net/z/se/open/20140411/1116007-013A/CHARLIE-013A-1cfb51e64a520755_,900,348,564,1680,2800,.mp4.csmil/manifest.f4m?g=TJBIMDPOHUWD&hdcore=3.2.0" -c copy -bsf:a aac_adtstoasc "C:\Users\Daniel\Videos\Charlie och Lola\Det var inte jag.mp4"
###
###
###
# GetVideoStream.ps1 -url 'http://www.svtplay.se/alfons-aberg/' -file '\\Qnapen\Multimedia\Barn\Alfons Åberg\Säsong 3 Avsnitt 11.mp4'
# GetVideoStream.ps1 -url 'http://www.svtplay.se/vem/' -file '\\Qnapen\Multimedia\Barn\Vem\Säsong 2 Avsnitt 7.mp4'
# GetVideoStream.ps1 -url 'http://www.tv4play.se/barn/thomas-t%C3%A5get?video_id=2641017' -file '\\Qnapen\Multimedia\Barn\Thomas tåget\Säsong 4 Avsnitt 8.mp4' # http://www.tv4play.se/barn
###
# GetVideoStream.ps1 -url 'http://www.svtplay.se/emil-i-lonneberga' -file 'C:\Users\Daniel\Videos\Emil i Lönneberga\.mp4'
# GetVideoStream.ps1 -url 'http://www.svtplay.se/mamma-mu' -file 'C:\Users\Daniel\Videos\Mamma Mu\.mp4'
# GetVideoStream.ps1 -url 'http://www.svtplay.se/pettson-och-findus' -file 'C:\Users\Daniel\Videos\Pettson och Findus\.mp4'
# GetVideoStream.ps1 -url 'http://www.svtplay.se/staden' -file 'C:\Users\Daniel\Videos\Staden\Tunnelbanan.mp4' #lördag
###
# Får ej tag på strömmarna
# GetVideoStream.ps1 -url 'http://www.svtplay.se/video/1698102/del-11-av-13-sugga-ar-ocksa-galen' -file 'C:\Users\Daniel\Videos\Emil i Lönneberga\Del 11 av 13.mp4'
# GetVideoStream.ps1 -url 'http://www.svtplay.se/video/1701181/del-12-av-13-griseknoens-markliga-bravader' -file 'C:\Users\Daniel\Videos\Emil i Lönneberga\Del 12 av 13.mp4'
# GetVideoStream.ps1 -url 'http://www.svtplay.se/video/1701791/del-13-av13' -file 'C:\Users\Daniel\Videos\Emil i Lönneberga\Del 13 av 13.mp4'
# GetVideoStream.ps1 -url 'http://www.svtplay.se/video/39950/del-10' -file 'C:\Users\Daniel\Videos\Mamma Mu\Del 10 av 13.mp4'
# GetVideoStream.ps1 -url 'http://www.svtplay.se/video/119166/del-10-av-10-jattegravmaskin' -file 'C:\Users\Daniel\Videos\Stora maskiner\Jättegrävmaskin.mp4'
###
# Alla tiders hits http://www.svt.se/alla-tiders-hits/se-program//rss.xml?includeVideo=true
# Husdrömmar http://www.svt.se/husdrommar/se-program//rss.xml?includeVideo=true
# Musik special http://www.svt.se/musik-special/se-program//rss.xml?includeVideo=true
# Niklas mat http://www.svt.se/niklas-mat/se-program//rss.xml?includeVideo=true
# von Svenssons kläder http://www.svt.se/von-svenssons-klader/se-program//rss.xml?includeVideo=true
# Telefonsupporten http://www.svt.se/telefonsupporten/se-program//rss.xml?includeVideo=true
# Tjockare än vatten http://www.svt.se/tjockare-an-vatten/se-program//rss.xml?includeVideo=true
# Trädgårdskampen http://www.svt.se/tradgardskampen/se-program//rss.xml?includeVideo=true
# Sherlock http://www.svt.se/sherlock/se-program//rss.xml?includeVideo=true
# Svensk humor http://www.svt.se/svensk-humor/se-program//rss.xml?includeVideo=true
# Dokument inifrån http://www.svt.se/dokument-inifran/se-program//rss.xml?includeVideo=true
# Dokument utifrån http://www.svt.se/dokument-utifran/se-program//rss.xml?includeVideo=true
# Dokumentärfilm http://www.svt.se/dokumentarfilm/se-program//rss.xml?includeVideo=true
# DOX http://www.svt.se/dox/se-program//rss.xml?includeVideo=true
# Uppdrag grankning http://www.svt.se/ug/se-program//rss.xml?includeVideo=true
###