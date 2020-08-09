<template>
    <div>
        <img :src="card.image" :alt="card.value" class="card-image">
    </div>
</template>

<script>
// { code: "AS", image: "https://deckofcardsapi.com/static/img/AS.png", value: "ACE", suit: "SPADES" }
export default {
    props: {
        card: {
            required: true,
            type: Object,
        },
    },
    data: () => {
        return {};
    },
    methods: {},
} 
</script>


<style scoped>
.card-image {
    object-fit: cover;
    width: 100%;
}
</style>