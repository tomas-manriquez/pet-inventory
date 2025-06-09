<script>
export default {
    data() {
        return {
            pets: [],
            render: false,
        }
    },
    watch: {
        renderList() {
            if (pets) this.render = true
            else this.render = false
            console.log("InventoryList.vue: ", console.log)
        }
    },
}
</script>

<template>
    <p>Hola</p>
    <ol v-if="render" v-for="pet in pets" v-bind="pet.id">
        <span> {{ pet.name }}</span>
    </ol>
</template>