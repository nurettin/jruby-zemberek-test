#encoding: UTF-8

require 'java'
require_relative 'lib/java/zemberek/zemberek-cekirdek-2.1.1.jar'
require_relative 'lib/java/zemberek/zemberek-tr-2.1.1.jar'

java_import 'net.zemberek.erisim.Zemberek'
java_import 'net.zemberek.tr.yapi.TurkiyeTurkcesi'

java_import 'net.zemberek.araclar.turkce.YaziIsleyici'
java_import 'net.zemberek.araclar.turkce.YaziBirimi'

require 'pp'

z= Zemberek.new(TurkiyeTurkcesi.new)

metin= "ne yapsam aşktan kaçamıyorum apple"

dizi= YaziIsleyici.analizDizisiOlustur(metin).reject{ |kelime| kelime.icerik.strip.empty? }
cozumler= dizi.map{ |kelime| [kelime.icerik, z.kelimeDenetle(kelime.icerik) ? "Türkçe": z.oner(kelime.icerik).first] 
#z.kelimeCozumle(kelime.icerik) 
}

p metin
p cozumler
