#encoding: UTF-8

require 'java'
require_relative 'lib/java/zemberek/zemberek-cekirdek-2.1.1.jar'
java_import 'net.zemberek.erisim.Zemberek'
java_import 'net.zemberek.araclar.turkce.YaziIsleyici'
java_import 'net.zemberek.araclar.turkce.YaziBirimi'

require_relative 'lib/java/zemberek/zemberek-tr-2.1.1.jar'
java_import 'net.zemberek.tr.yapi.TurkiyeTurkcesi'

z= Zemberek.new(TurkiyeTurkcesi.new)

metin= "ne yapsam aşktan kaçamıyorum yağmurdan kaçabildiğim kador apple"

dizi= YaziIsleyici.analizDizisiOlustur(metin).
	reject{ |kelime| kelime.icerik.strip.empty? }

cozumler= dizi.map do |kelime| 
	[
		kelime.icerik, 
		z.kelimeCozumle(kelime.icerik),
		if z.kelimeDenetle(kelime.icerik) 
			"Türkçe"
		else
			z.oner(kelime.icerik).first
		end
	] 
end

p metin
p cozumler
