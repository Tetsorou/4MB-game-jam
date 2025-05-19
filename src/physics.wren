
class Physics {
    static relative_id{__relative_id}
    static position{__position}
    static id_position{__id_position}
    static init() {
        __relative_id = {}
        __position = {}
        __id_position = {}
    }
    // # pos_vector is a Vector.new(x,y)
    // # id is id + 1
    // # tile_type_material is tile_type with material appended, so unique names
    // # ids is a list of the ids that are at the pos_vector, this *will*
    //    work nicely with everything once I implement the grid system
    // relative_id[id] = (tile_type_material) { _relative_id[id] = tile_type_material}
    // position[id] = (pos_vector) { _position[id] = pos_vector}
    // id_position[pos_vector] = (ids) { _id_position[pos_vector] = ids} 
    
     // A method to calculate physics using all the pos_vectors, be it gravity or wall collision
    //  the position could take the id of a character/enemy and do its collision stuff idk
    calculate {}

}