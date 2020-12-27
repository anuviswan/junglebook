const getCategories = ()=>{
    return [
        {
            title:"Birds",
            icon : "fa fa-twitter",
        },
        {
            title:"Animals",
            icon : "fa fa-hippo"
        },
        {
            title:"Flags",
            icon : "fa fa-flag"
        }
    ]
}


const getItemsForCategory = (category)=>{

    console.log(category);
    return[{
        type:'image',
        key: 'Parrot',
        url:'https://thumbs.dreamstime.com/z/macow-parrot-66772.jpg',
    },
    {
        type:'image',
        key: 'Macow',
        url:'https://thumbs.dreamstime.com/z/macow-parrot-66772.jpg',
    }];
}


const getRandomItem = (category) =>{
    const items = getItemsForCategory(category);
    var item = items[Math.floor(Math.random() * items.length)];
    return item;
}
export {
    getCategories,
    getItemsForCategory,
    getRandomItem
}