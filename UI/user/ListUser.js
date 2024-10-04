
function updateUsersModel()
{
    userListModel.clear();
    var jsondata = dbMan.getUsersByteArray();
    jsondata = JSON.parse(jsondata);
    // id, name, lastname, nat_id, job_position, enabled, admin, gender
    var FEMALE;
    for(var obj of jsondata)
    {
        FEMALE = (obj.gender === "خانم")? true : false;
        userListModel.append({ Id: obj.id, Name: obj.name, Lastname: obj.lastname, Nat_id: obj.nat_id, Job_position: obj.job_position, Enabled: obj.enabled, Admin: obj.admin, UserFemale: FEMALE })
    }
}
