const state = {
    currentCategory:'',
    questionCache:[]
};

const getters ={
    currentCategory:(state) => state.currentCategory,
    questionCache:(state)=> state.questionCache
};

const actions = {
    updateCategory({commit},categoryName){
        commit("updateCategory",categoryName);
    },
    AddToCache({commit},categoryMetaInfo){
        console.log(categoryMetaInfo.values)
        commit["updateQuestionCache",{
            category: categoryMetaInfo.categoryName,
            questions: categoryMetaInfo.values
        }]
    }
}

const mutations = {
    updateCategory: (state,category) => (state.currentCategory = category),
    updateQuestionCache:(state,value) => (state.questionCache.push(...value))
};

export default{
    state,
    getters,
    actions,
    mutations
}
