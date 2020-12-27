<template>
  <v-app-bar app dark color="primary darken-2" rounded="true">
    <v-toolbar-title class="ml-2">
      <div class="logo">
        <i class="fa fa-superpowers fa-2x" aria-hidden="true"> Quiki</i>
      </div>
    </v-toolbar-title>
  </v-app-bar>
</template>

<script>
export default {
  name: "Navbar",
};
</script>

<style scoped>
.logo {
  color: white;
  font-family: "Eczar";
  font-size: 2vh;
  font-weight: bold;
  font-style: italic;
  text-align: center;
}
</style>
