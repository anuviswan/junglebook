const state = {
    currentUser: {},
  };
  
  const getters = {
    currentUser: (state) => state.currentUser,
  };
  
  const actions = {
    updateCurrentUser({ commit }, user) {
      commit("updateCurrentUser", user);
    },
    clearUser({commit}){
      commit("updateCurrentUser",{})
    },
    
  };
  
  const mutations = {
    updateCurrentUser: (state, user) => (state.currentUser = user),
  };
  
  export default {
    state,
    getters,
    actions,
    mutations,
  };
  