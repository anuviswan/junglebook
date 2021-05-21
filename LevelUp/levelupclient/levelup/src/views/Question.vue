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
    <v-row>
      <v-col>
        <img
          src="http://127.0.0.1:10000/devstoreaccount1/levelupimagestore/4260c34d-0fd4-4c66-a8e4-426828c0431d.jpg"
        />
      </v-col>
    </v-row>
    <v-row
      ><v-col>
        <v-card>
          <v-form v-model="valid" @submit="onSubmit">
            <v-container>
              <v-row>
                <v-col cols="12">
                  <v-banner single-line color="blue" elevation="4" rounded dark
                    >Type your answer here</v-banner
                  >
                </v-col>
              </v-row>
              <v-row>
                <v-col cols="12" md="12">
                  <v-text-field
                    v-model="answer"
                    :rules="nameRules"
                    label="Answer"
                    required
                  ></v-text-field>
                </v-col>
              </v-row>
              <v-row>
                <v-col
                  ><v-btn color="blue" type="submit" dark>Check Answer</v-btn>
                </v-col>
              </v-row>
            </v-container>
          </v-form>
        </v-card>
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
      answer: "",
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
