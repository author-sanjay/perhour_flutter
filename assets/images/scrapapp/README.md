this python parser is using [scrapy](https://scrapy.org)

install it first with pip along with flask

```
pip install scrapy
pip install crochet
pip install flask
```

To run the server
```
python3 scrapapp.py
```



To Test the search API
```
curl http://127.0.0.1:5000/search?q=delaunay&p=1
```

To test the detail API
```
curl http://127.0.0.1:5000/detail/DELAUNAY-SONIA-1885-1979/598-delaunay_sonia_1885-05.3.23-dvc
```
parameters:
* q : the query (mandatory)
* s : section 1:future sales, 2: past sales  (2 by default)
* p : page number (1 by default)


Example of response:
```
[
  {
    "date": "02 Mar 2019",
    "img": "https://gcp-la8-storage-cdn.lot-art.com/public/upl/2/302-delaunay_terk-02.3.19-arle_1567638164_7937-thumb.jpg",
    "title": "DELAUNAY TERK S\u2026"
  },
  {
    "date": "10 Mar 2019",
    "img": "https://gcp-la8-storage-cdn.lot-art.com/public/upl/71/171-delaunay_sonia_1885-10.3.19-bedot_1567646052_2875-thumb.jpg",
    "title": "DELAUNAY Sonia (1885 - 1979)"
  },
  {
    "date": "17 Mar 2019",
    "img": "https://gcp-la8-storage-cdn.lot-art.com/public/upl/31/331-delaunay_sonia_1885-17.3.19-bedot_1567651879_5422-thumb.jpg",
    "title": "DELAUNAY Sonia (1885 - 1979)"
  }
]
```

To execute the test webcrawl of the search page
```
scrapy runspider testSpider.py -o lots.jsonl
```

To execute the test webcrawl of a detail page
```
scrapy runspider testSpiderDetail.py -o lots.jsonl
```

To execute the test webcrawl of a detail page
```
scrapy runspider testSpiderDetail.py -o lots.jsonl
```
