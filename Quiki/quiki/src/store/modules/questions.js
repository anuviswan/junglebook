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
        console.log('here');
        console.log(categoryMetaInfo);
        commit("updateQuestionCache",categoryMetaInfo)
    }
}

const mutations = {
    updateCategory: (state,category) => (state.currentCategory = category),
    updateQuestionCache:(state,question) => (state.questionCache.push(question))
};

export default{
    state,
    getters,
    actions,
    mutations
}
