<template>
  <v-container>
    <v-row>
      <v-col>
        <v-sheet
          class="text-h2"
          elevation="1"
          rounded
          color="blue accent-2"
          dark
          >LEVEL {{ level }}</v-sheet
        >
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import { getNextQuestion } from "../api/user";
import { mapGetters } from "vuex";
export default {
  name: "Question",
  data() {
    return {
      level: 1,
    };
  },
  computed: mapGetters(["currentUser"]),
  async created() {
    const result = await getNextQuestion(this.currentUser);
    console.log(result);
  },
};
</script>

<style></style>
