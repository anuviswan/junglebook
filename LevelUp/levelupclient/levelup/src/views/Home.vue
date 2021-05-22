<template>
  <v-container v-if="isSmall">
    <v-row>
      <v-col><Story /> </v-col>
    </v-row>
    <v-row>
      <v-col cols="12">
        <Login />
      </v-col>
    </v-row>
    <v-row>
      <v-col>
        <Leaderboard />
      </v-col>
    </v-row>
  </v-container>
  <v-container v-else>
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
    <v-row>
      <v-col cols="8"> </v-col>
      <v-col cols="4">
        <Rules />
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
// @ is an alias to /src
import Leaderboard from "../components/Leaderboard.vue";
import Login from "../components/Login.vue";
import Story from "../components/Story.vue";
import Rules from "../components/Rules.vue";

export default {
  name: "Home",
  components: {
    Leaderboard,
    Login,
    Story,
    Rules,
  },
  computed: {
    isSmall() {
      switch (this.$vuetify.breakpoint.name) {
        case "xs":
          return true;
        case "sm":
          return true;
        case "md":
          return false;
        case "lg":
          return false;
        case "xl":
          return false;
      }
      return false;
    },
  },
};
</script>
