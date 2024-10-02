
// //access
function updateAccessBranch() {

    //var jsondata = '[{"id":1, "city":"تهران", "branch_name":"شعبه میرداماد", "address":"منطقه۳ - میرداماد، میدان مادر (محسنی)، خیابان رودبار غربی", "description":"دوره اول میرداماد"}]';
    var jsondata = dbMan.getBranchesJson();
    jsondata = JSON.parse(jsondata);

    for(var obj of jsondata)
        accessBranchModel.append({ id: obj.id, city: obj.city, branch_name: obj.branch_name, address: obj.address, description: obj.description})

    //update
    updateAccessStep();

}

function updateAccessStep() {

    // should get steps of enabled branch
    var jsondata = dbMan.getStepsJson(accessBranch);
    jsondata = JSON.parse(jsondata);

    for(var obj of jsondata)
    {
        accessStepModel.append({ id: obj.id, branch_id: obj.branch_id, step_name: obj.step_name, branch_name: obj.branch_name})
    }

    //update
    updateAccessBasis();
}

function updateAccessBasis() {

    var jsondata = dbMan.getBasisJson(accessStep);
    jsondata = JSON.parse(jsondata);

    for(var obj of jsondata)
    {
        accessBasisModel.append({ id: obj.id, step_id: obj.step_id, basis_name: obj.basis_name, step_name: obj.step_name, branch_name: obj.branch_name })
    }
}

function updateAccessAppModule() {
    accessappModuleModel.clear();
    // should get steps of enabled branch
    var jsondata = '[{"id":1, "module_name":"user", "description":"مدیریت کاربران"}, {"id":2, "module_name":"branch", "description":"مدیریت شعبه ها"}, {"id":3, "module_name":"step", "description":"مدیریت دوره ها"}]';
    jsondata = JSON.parse(jsondata);

    for(var obj of jsondata)
    {
        accessappModuleModel.append({ id: obj.id, module_name: obj.module_name, description: obj.description})
    }
}

// update access
function updateAccess()
{
}

//Permissions
function updatePermissionBranch()
{
    permBranchModel.clear();
    var jsondata = '[{"id":1, "city":"تهران", "branch_name":"شعبه میرداماد", "address":"منطقه۳ - میرداماد، میدان مادر (محسنی)، خیابان رودبار غربی", "description":"دوره اول میرداماد"}]';
    jsondata = JSON.parse(jsondata);

    for(var obj of jsondata)
    {
        permBranchModel.append({ id: obj.id, city: obj.city, branch_name: obj.branch_name, address: obj.address, description: obj.description})
    }
}

function updatePermissionStep()
{
    permStepModel.clear();
    // should get steps of enabled branch
    var jsondata = '[{"id":1, "branch_id":"1", "step_name":"دوره اول میرداماد"}, {"id":1, "branch_id":"1", "step_name":"دوره دوم میرداماد"}]';
    jsondata = JSON.parse(jsondata);

    for(var obj of jsondata)
    {
        permStepModel.append({ id: obj.id, branch_id: obj.branch_id, step_name: obj.step_name})
    }
}

function updatePermissionBasis()
{
    permBasisModel.clear();
    // should get steps of enabled branch
    var jsondata = '[{"id":1, "step_id":"1", "basis_name":"پایه ۷"}, {"id":2, "step_id":"1", "basis_name":"پایه ۸"}, {"id":3, "step_id":"1", "basis_name":"پایه ۹"}]';
    jsondata = JSON.parse(jsondata);

    for(var obj of jsondata)
    {
        permBasisModel.append({ id: obj.id, step_id: obj.step_id, basis_name: obj.basis_name})
    }
}

//update permission
function updatePermission()
{
}

