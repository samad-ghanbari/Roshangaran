
// //access
function updateAccessBranch() {

    //var jsondata = '[{"id":1, "city":"تهران", "branch_name":"شعبه میرداماد", "address":"منطقه۳ - میرداماد، میدان مادر (محسنی)، خیابان رودبار غربی", "description":"دوره اول میرداماد"}]';
    var jsondata = dbMan.getBranchesJson();
    jsondata = JSON.parse(jsondata);
    branchJson = jsondata;
    for(var obj of jsondata)
        accessBranchModel.append({ id: obj.id, city: obj.city, branch_name: obj.branch_name, address: obj.address, description: obj.description})


    //update
    updateAccessStep();
    updatePermissionBranch();

}

function updateAccessStep() {

    // should get steps of enabled branch
    var jsondata = dbMan.getStepsJson(accessBranch);
    jsondata = JSON.parse(jsondata);
    stepJson = jsondata;
    for(var obj of jsondata)
    {
        accessStepModel.append({ id: obj.id, branch_id: obj.branch_id, step_name: obj.step_name, branch_name: obj.branch_name})
    }

    //update
    updateAccessBasis();
    updatePermissionStep();
}

function updateAccessBasis() {

    var jsondata = dbMan.getBasisJson(accessStep);
    jsondata = JSON.parse(jsondata);
    basisJson = jsondata;
    for(var obj of jsondata)
    {
        accessBasisModel.append({ id: obj.id, step_id: obj.step_id, basis_name: obj.basis_name, step_name: obj.step_name, branch_name: obj.branch_name })
    }

    updatePermissionBasis();
}

function updateAccessAppModule() {
    accessappModuleModel.clear();
    // should get steps of enabled branch
    var jsondata = dbMan.getAppModulesJson();
    jsondata = JSON.parse(jsondata);

    for(var obj of jsondata)
    {
        accessappModuleModel.append({ id: obj.id, module_name: obj.module_name, description: obj.description})
    }
}


//Permissions

function updatePermissionBranch()
{
    permissionBranchModel.clear();
    var jsondata = dbMan.getBranchesJsonById(accessBranch);
    jsondata = JSON.parse(jsondata);

    for(var obj of jsondata)
            permissionBranchModel.append({ id: obj.id, city: obj.city, branch_name: obj.branch_name, address: obj.address, description: obj.description});
}

function updatePermissionStep()
{
    permissionStepModel.clear();
    var jsondata = dbMan.getStepsJsonById(accessStep);
    jsondata = JSON.parse(jsondata);
    for(var obj of jsondata)
            permissionStepModel.append({ id: obj.id, branch_id: obj.branch_id, step_name: obj.step_name, branch_name: obj.branch_name})
}

function updatePermissionBasis()
{
    permissionBasisModel.clear();
    var jsondata = dbMan.getBasisJsonById(accessBasis);
    jsondata = JSON.parse(jsondata);
    for(var obj of jsondata)
            permissionBasisModel.append({ id: obj.id, step_id: obj.step_id, basis_name: obj.basis_name, step_name: obj.step_name, branch_name: obj.branch_name })
}
