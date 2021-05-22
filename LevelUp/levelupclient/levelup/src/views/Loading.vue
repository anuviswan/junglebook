<template>
  <v-container>
    <v-banner>Loading....</v-banner>
  </v-container>
</template>

<script>
export default {
  name: "Loading",
  created() {
    this.$router.push("question");
  },
};
</script>

<style></style>
