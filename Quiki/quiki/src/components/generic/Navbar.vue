<template>
  <v-app-bar app dark color="primary darken-2" rounded="true">
    <v-toolbar-title class="ml-2">
      <div class="logo">
        <i class="fa fa-superpowers fa-3x" aria-hidden="true"
          ><span class="ml-3 ">{{ this.appTitle }}</span></i
        >
      </div>
    </v-toolbar-title>
    <v-spacer></v-spacer>
    <v-btn icon to="/home">
      <v-icon>mdi-home</v-icon>
    </v-btn>
  </v-app-bar>
</template>

<script>
export default {
  name: "Navbar",
  data() {
    return {
      appTitle: "",
    };
  },
  created() {
    this.appTitle = process.env.VUE_APP_TITLE;
  },
};
</script>

<style scoped>
i {
  margin-right: 10px;
}

.logo {
  color: white;
  font-family: "Eczar";
  font-size: 2vh;
  font-weight: bold;
  font-style: italic;
  text-align: center;
}
</style>
