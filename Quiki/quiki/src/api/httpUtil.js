import store from "../store/index"
import axios from "axios"
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


const getItemsForCategory = async (category)=>{

    const fromCache = store.getters.questionCache.filter(e => e.categoryName === category);

    if(fromCache.length > 0)
    {
        return fromCache;
    }

    var params = {
        params:{
            appName:'quiki',
            categoryName:category   
        }
         
    };
    var response = await axios.get('http://localhost:7071/api/item/getall',params);
    const result = response.data.map(item=>{
        const serializedData = JSON.parse(item.value);

        return {
            type: serializedData.type,
            url: serializedData.url,
            key: serializedData.key
        };
    });


    return result;

}


const getRandomItem = async (category) =>{

    const items = await getItemsForCategory(category);
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