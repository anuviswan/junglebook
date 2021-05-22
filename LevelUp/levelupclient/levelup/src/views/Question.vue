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
        <v-img v-bind:src="imageUrl" />
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
                    label="Answer"
                    required
                  ></v-text-field>
                </v-col>
              </v-row>
              <v-row v-if="this.message">
                <v-col v-if="isCorrectAnswer"
                  ><v-alert type="success">{{ this.message }} </v-alert></v-col
                >
                <v-col v-else
                  ><v-alert type="error">{{ this.message }} </v-alert>
                </v-col>
              </v-row>

              <v-row v-if="isCorrectAnswer">
                <v-col>
                  <v-btn color="blue" dark click="OnSuccess"
                    >Go to next level</v-btn
                  >
                </v-col>
              </v-row>

              <v-row v-else>
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
import { getNextQuestion, validateAnswer } from "../api/user";
import { mapGetters } from "vuex";
export default {
  name: "Question",
  data() {
    return {
      valid: false,
      level: 1,
      answer: "",
      imageUrl: "",
      message: "",
      isCorrectAnswer: false,
    };
  },
  computed: mapGetters(["currentUser"]),
  methods: {
    onSuccess() {
      console.log("Success");
    },
    async onSubmit(e) {
      e.preventDefault();

      var result = await validateAnswer(
        this.currentUser.userName,
        this.level,
        this.answer
      );

      if (result.hasError) {
        console.log(result);
        return;
      }

      this.message = result.data.message;
      this.isCorrectAnswer = result.data.result;
      console.log(result.data);
    },
  },
  async created() {
    const result = await getNextQuestion(this.currentUser.userName);
    if (result.hasError) {
      this.$router.push("/");
      return;
    }
    console.log(result);
    this.imageUrl = result.data.url;
    this.level = result.data.level;
  },
};
</script>

<style></style>
