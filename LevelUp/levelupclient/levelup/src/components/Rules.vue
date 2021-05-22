<template>
  <v-card>
    <v-container>
      <v-row>
        <v-col class="font-weight-bold">Rules</v-col>
      </v-row>
      <v-row>
        <v-col class="font-italic">
          <v-list dense>
            <v-list-item v-for="(item, i) in rulesCollection" :key="i">
              <v-list-item-icon>
                <v-icon small>fas fa-code</v-icon>
              </v-list-item-icon>
              <v-list-item-content>
                <v-list-item-title v-text="item.text"></v-list-item-title>
              </v-list-item-content>
            </v-list-item>
          </v-list>
        </v-col>
      </v-row>
    </v-container>
  </v-card>
</template>

<script>
export default {
  name: "Rules",
  data() {
    return {
      rulesCollection: [
        {
          icon: "mdi-Account ",
          text: "Use the same Username when you login back to continue",
        },
        {
          icon: "mdiAccount",
          text: "Do not refresh once in questions page",
        },
      ],
    };
  },
};
</script>

<style></style>
