%dw 2.0
output application/json
---
//merging the input data based on bookid
payload.store.books map ((i,ind) -> using (id = i.bookId){
    id: i.bookId,
    title: i.title,
    price: i.price,
    (payload.store.authors filter ((item, index) -> item.bookId contains  id) map
    {
        authors: $.author
    })
})
