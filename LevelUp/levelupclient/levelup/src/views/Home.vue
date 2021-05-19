<template>
  <v-container>
    <v-row>
      <v-col><Story /> </v-col>
    </v-row>
    <v-row>
      <v-col cols="8">
        <Leaderboard />
      </v-col>
      <v-col cols="4">
        <Login />
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
// @ is an alias to /src
import Leaderboard from "../components/Leaderboard.vue";
import Login from "../components/Login.vue";
import Story from "../components/Story.vue";

export default {
  name: "Home",
  components: {
    Leaderboard,
    Login,
    Story,
  },
};
</script>
