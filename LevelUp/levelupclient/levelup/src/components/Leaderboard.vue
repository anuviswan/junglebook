<template>
  <v-card>
    <v-container>
      <v-row>
        <v-col col="12">
          <v-banner single-line color="blue" elevation="4" rounded dark
            >LEADER BOARD</v-banner
          >
        </v-col>
      </v-row>
      <v-row>
        <v-col cols="12">
          <v-simple-table>
            <template v-slot:default>
              <thead>
                <tr>
                  <th class="text-left">
                    Rank
                  </th>
                  <th class="text-left">
                    User
                  </th>
                  <th class="text-left">
                    Level
                  </th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="item in participants" :key="item.name">
                  <td class="text-left">{{ item.rank }}</td>
                  <td class="text-left">{{ item.userName }}</td>
                  <td class="text-left">{{ item.level }}</td>
                </tr>
              </tbody>
            </template>
          </v-simple-table>
        </v-col>
      </v-row>
    </v-container>
  </v-card>
</template>

<script>
export default {
  name: "Leaderboard",
  data() {
    return {
      participants: [
        {
          userName: "sreena",
          rank: 1,
          level: 1,
        },
        {
          userName: "anu",
          rank: 1,
          level: 1,
        },
        {
          userName: "jia",
          rank: 1,
          level: 1,
        },
        {
          userName: "naina",
          rank: 1,
          level: 1,
        },
        {
          userName: "manu",
          rank: 1,
          level: 1,
        },
        {
          userName: "praji",
          rank: 1,
          level: 1,
        },
      ],
    };
  },
};
</script>

<style></style>
