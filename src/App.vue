
<template>
  <div>
    <div class="title">
      <section>
        <h1>BLACKJACK</h1>
        <div class="startingButtons">
          <button @click="singlePlayer">POJEDYŃCZY GRACZ</button>
          <button>DWÓCH GRACZY</button>
          
        </div>
<h2 class="suits">♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ </h2>
      </section>
    </div>
    <SinglePlayer v-if="singlePlayerMode"></SinglePlayer>
    <div class="newGameButton">
      <button @click="newGame">NOWA GRA</button>
    </div>
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
    newGame() {
      this.singlePlayerMode = false;
    },
    singlePlayer() {
      console.log("rozpoczynamy singlePlayera");
      this.singlePlayerMode = true;
    }
  }
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
.suits {
  display: grid;
  grid-template-columns: auto;
  text-align: center;
}
.newGameButton {
  display: grid;
  grid-template-columns: 100%;
}
.startingButtons {
  display: grid;
  grid-template-columns: 50% 50%;
}
</style>
