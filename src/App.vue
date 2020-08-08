
<template>
  <div>
    <div class="title">
      <section>
        <h1>BLACKJACK</h1>
        <div>
          <button @click="singlePlayer">POJEDYŃCZY GRACZ</button>
          <!-- <button @click="multiPlayer">DWÓCH GRACZY</button> -->
          <h2 class="footer">♠ ♥ ♦ ♣</h2>
        </div>
      </section>
    </div>
    <SinglePlayer v-if="singlePlayerMode"></SinglePlayer>
  </div>
</template>


<script>
import SinglePlayer from "./components/SinglePlayer.vue";

export default {
  data: function() {
    return {
      singlePlayerMode: false
    };
  },
  components: {
    SinglePlayer
  },
   methods: {
    singlePlayer() {
      console.log('rozpoczynamy singlePlayera');
      this.singlePlayerMode = true;
    }
  },
};
</script>
<style>
body,
html {
  background-color: green;
}
.title {
  display: grid;
  grid-template-columns: auto;
  font-family: Arial, Helvetica, sans-serif;
  font-size: 2rem;
  text-align: center;
}
.footer {
  text-align: center;
}
</style>
