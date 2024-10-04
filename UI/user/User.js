
//a access
function accessBranchModel()
{
    // userBranchListModel.clear();
    // var branchArray = user["access"].branch;
    // var branches = dbMan.getBranchesJsonById(branchArray);
    // branches = JSON.parse(branches);
    // //id, city, branch_name, address, description
    // for(var br of branches)
    // {
    //     userBranchListModel.append({city: br.city, branchName: br.branch_name, address: br.address, description: br.description});
    // }
}

function accessStepModel()
{
    //var stepArray = user["access"]["step"];
    //var steps = dbMan.getStepsJsonById(stepArray);
    //id, branch_id, step_name, branch_name
}

function accessBasisModel()
{
    //var basisArray = user["access"]["basis"];
    //var basis = dbMan.getBasisJsonById(basisArray);
    //id, step_id, basis_name, step_name, branch_name
}

//write Permission

function permissionBranchModel()
{
    //var branchArray = user["write_permission"]["branch"];
    //var branches = dbMan.getBranchesJsonById(branchArray);
    //id, city, branch_name, address, description
}

function permissionStepModel()
{
    //var stepArray = user["write_permission"]["step"];
    //var steps = dbMan.getStepsJsonById(stepArray);
    //  id, branch_id, step_name, branch_name

}

function permissionBasisModel()
{
    //var basisArray = user["write_permission"]["basis"];
    //var basis = dbMan.getBasisJsonById(basisArray);
    //  id, step_id, basis_name, step_name, branch_name

}
