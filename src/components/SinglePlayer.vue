<template>
  <div class="display">
    <section>
      <div class="players"></div>
      <div class="playerName">GRACZ 1</div>
      <div>{{ startingCards }}</div>
      <button @click="fetchStartingCards2">ZACZNIJ</button>
    </section>
    <section>
      <div></div>
      <div class="playerName">GRACZ 2</div>
      <div>{{ startingCards2 }}</div>
      <button @click="fetchStartingCards">ZACZNIJ</button>
    </section>
  </div>
</template>

<script>
export default {
  data: function() {
    return {
      startingCards: [],
      startingCards2: []
    };
  },
  methods: {
    addStartingCards(twoCards) {
      this.startingCards.push(twoCards);
    },
    addStartingCards2(twoCards2) {
      this.startingCards2.push(twoCards2);
    },
    fetchStartingCards() {
      let promise = fetch(
        "https://deckofcardsapi.com/api/deck/new/draw/?count=2"
      );
      promise
        .then(cards2 => {
          return cards2.json();
        })
        .then(cardsObject => {
          this.startingCards2.push(cardsObject);
        });
    },
     fetchStartingCards2() {
      let promise = fetch(
        "https://deckofcardsapi.com/api/deck/new/draw/?count=2"
      );
      promise
        .then(cards => {
          return cards.json();
        })
        .then(cardsObject => {
          this.startingCards.push(cardsObject);
        });
    }
  }
};
</script>
<style scoped>
.display {
  display: grid;
  grid-template-columns: 50% 50%;
  background-color: olivedrab;
}
.players {
  background-color: olivedrab;
  font-family: Arial, Helvetica, sans-serif;
}
.playerName {
  font-family: sans-serif;
  color: orange;
}
</style>