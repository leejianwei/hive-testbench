DIMS="date_dim time_dim item customer customer_demographics household_demographics customer_address store promotion warehouse ship_mode reason income_band call_center web_page catalog_page web_site"
FACTS="store_sales store_returns web_sales web_returns catalog_sales catalog_returns inventory"

for t in ${DIMS}
do
	presto-cli --catalog kudu --schema default -f kudu/${t}.sql
	echo "create Presto table over Kudu: " ${t}
done

for t in ${FACTS}
do
	presto-cli --catalog kudu --schema default -f kudu/${t}.sql
	echo "create Presto table over Kudu: " ${t}
done
