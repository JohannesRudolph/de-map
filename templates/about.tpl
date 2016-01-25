<h3>Wie es funktioniert</h3>
<h4>Datenquelle</h4>
<p>
	Die Karte nutzt die <a href="https://github.com/freifunk/directory.api.freifunk.net" target="_blank">Freifunk Api</a> um eine Liste der
	Communities in Deutschland zu beziehen. Aus deren API-Files werden dann die Links zu Knotenkarten gelesen.
</p>
<p>
	3 Arten von Knotenkarten können dann zum Beziehen von Daten genutzt werden: Netmon, ffmap und OpenWifiMap.
	Die dort gezeigten Knoten/Router/Zugangspunkte der jeweiligen Community fließen dann in diese Karte ein.
</p>
<p>
	Als viertes Format wird &quot;nodelist&quot; verarbeitet, welches für alle Communities sinnvoll ist, die keine der 3 Kartenlösungen verwenden.<br>
	Informationen zur nodelist gibt es auf <a href="https://github.com/ffansbach/nodelist" target="_blank">github -&gt; nodelist</a>.
</p>
<h4>Verarbeitung</h4>
<p>
	Alle 60 Minuten werden die Daten neu verarbeitet und so aktualisiert.
</p>
<p>
	Knoten, die länger offline sind, werden nicht auf der Karte angezeigt.
	Falls bekannt ist, dass sie weniger als 3 Tage offline sind, werden sie grau dargestellt.
</p>
