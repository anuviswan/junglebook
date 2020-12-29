import store from "../store/index"

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

    console.log("Attempting to update store")
    // store.dispatch('updateCategory','something')
    console.log(store.getters.currentCategory)
    console.log(category);
    return[{
        type:'image',
        key: 'Parrot',
        url:'https://thumbs.dreamstime.com/z/macow-parrot-66772.jpg',
    },
    {
        type:'image',
        key: 'Macow',
        url:'http://www.baltana.com/files/wallpapers-6/Scarlet-Macaw-HD-Wallpaper-20366.jpg',
    }];
}


const getRandomItem = (category) =>{
    const items = getItemsForCategory(category);
    store.dispatch('AddToCache',{
        categoryName:category,
        values:items
    });
    var item = items[Math.floor(Math.random() * items.length)];
    return item;
}
export {
    getCategories,
    getItemsForCategory,
    getRandomItem
}