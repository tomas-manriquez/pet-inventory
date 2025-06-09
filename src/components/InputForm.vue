<script>
let id = 0
export default {
    data() {
        return {
            newPet: {id: null, name: '', specie: '', age: 0},
            pets: []
        }
    },
    computed :{ },
methods: {
    addPet(){
        this.pets.push({id: id++, name: this.newPet.name, specie: this.newPet.specie, age: this.newPet.age})
        this.newPet = {id: id++, name:'', specie:'',age:0},
        console.log(this.pets)
    }
}
}

</script>

<template>
    <h1>Pet Inventory</h1>
    <form v-on:submit.prevent="addPet">
        <fieldset>
        Nombre
        <input id="name" v-model="newPet.name" type="text" required placeholder="Ingrese el nombre de la mascota">
        <br>
        Especie
        <select id="specie" v-model="newPet.specie"  name="Especie">
            <option value = "dog"> Perro</option>
            <option value = "cat"> Gato</option>
            <option value = "turtle"> Tortuga</option>
            <option value = "bunny"> Conejo</option>
            <option value = "hamster"> Hámster</option>
            <option value = "otro"> Otro</option>
        </select>
        <br>
        Edad
        <input id="age" v-model="newPet.age" type="number" required placeholder="Ingrese la edad de la mascota (años)">
        <br>
        <input type="submit" value="Agregar mascota">
        </fieldset>
    </form>
    <p v-if="this.pets.length>0"> Mascota agregada exitosamente!</p>
    <p v-else>Esperando input...</p>
    <table>
        <caption> Mascotas ingresadas</caption>
        <colgroup>
            <col span=3>
            <col>
        </colgroup>
        <thead>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Especie</th>
            <th>Edad</th>
        </tr>
        </thead>
        <tbody v-for="pet in pets" :key="pet.id">
            <tr>
            <td>{{ pet.id }}</td>
            <td>{{ pet.name}}</td>
            <td> {{ pet.specie }}</td>
            <td> {{ pet.age}}</td>
            </tr>
        </tbody>
    </table>
</template>