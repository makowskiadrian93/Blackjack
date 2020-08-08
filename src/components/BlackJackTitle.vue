<template>
  <div class="title">
    <section>
      <h1>BLACKJACK</h1>
      <div>
        <button @click="singlePlayer">POJEDYŃCZY GRACZ</button>
        <button @click="multiPlayer">DWÓCH GRACZY</button>
        <h2 class="footer">♠ ♥ ♦ ♣</h2>
      </div>
    </section>
  </div>
</template>

<script>
export default {
  data: function() {
    return {
        SinglePlayerMode: false,
    };
  },

};
</script>
<style scoped>
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