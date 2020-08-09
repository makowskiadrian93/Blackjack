<template>
  <div class="display">
    <section>
      <div class="players"></div>
      <div class="playerName">
        GRACZ 1
        <div>Wynik:</div>
      </div>
      <div class="optionButtons">
        <button @click="fetchStartingCards3">ZACZNIJ</button>
        <button @click="fetchOneCard3">DOBIERZ</button>
        <button @click="passTurn3">PASS</button>
      </div>
      <li v-for="card in startingCards" :key="card.suit">{{ card.suit }}</li>
    </section>
    <section>
      <div></div>
      <div class="playerName">
        GRACZ 2
        <div>Wynik:</div>
      </div>
      <div class="optionButtons">
          <button @click="fetchStartingCards4">ZACZNIJ</button>
        <button @click="fetchOneCard4">DOBIERZ</button>
        <button @click="passTurn4">PASS</button>
      </div>
      <div>{{ startingCards4 }}</div>
    </section>
  </div>
</template>

<script>
export default {
  data: function() {
    return {
      startingCards3: [],
      startingCards4: [],
      playerOnePass3: false,
      playerTwoPass4: false
    };
  },
  methods: {
 addStartingCards3(twoCards3) {
      this.startingCards3.push(twoCards3);
    },
     addStartingCards4(twoCards4) {
      this.startingCards4.push(twoCards4);
    },
    fetchStartingCards3() {
      let promise = fetch(
        "https://deckofcardsapi.com/api/deck/u6abs7bcjx7l/draw/?count=2"
      );
      promise
        .then(cards3 => {
          return cards3.json();
        })
        .then(cardsObject3 => {
          this.startingCards3.push(cardsObject3);
        });
    },
     fetchStartingCards4() {
      let promise = fetch(
        "https://deckofcardsapi.com/api/deck/u6abs7bcjx7l/draw/?count=2"
      );
      promise
        .then(cards4 => {
          return cards4.json();
        })
        .then(cardsObject4 => {
          this.startingCards4.push(cardsObject4);
        });
    },
    addNewCard3(oneCard3) {
      this.startingCards.push(oneCard3);
    },
    fetchOneCard3() {
      let promise = fetch(
        "https://deckofcardsapi.com/api/deck/u6abs7bcjx7l/draw/?count=1"
      );
      promise
        .then(cards3 => {
          return cards3.json();
        })
        .then(cardsObject3 => {
          this.startingCards3.push(cardsObject3);
        });
    },
     addNewCard4(oneCard3) {
      this.startingCards.push(oneCard3);
    },
    fetchOneCard4() {
      let promise = fetch(
        "https://deckofcardsapi.com/api/deck/u6abs7bcjx7l/draw/?count=1"
      );
      promise
        .then(cards4 => {
          return cards4.json();
        })
        .then(cardsObject4 => {
          this.startingCards4.push(cardsObject4);
        });
    },
  },
}
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
  background-color: rgb(4, 141, 141);
  color: black;
  font-family: sans-serif;
  font-size: 1rem;
  text-align: center;
}
.optionButtons {
  display: grid;
  grid-template-columns: 33% 33% 33%;
}
</style>