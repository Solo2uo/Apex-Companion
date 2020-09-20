<fieldset>
    <div class="form-group">
        <label for="username">Username *</label>
          <input type="text" name="username" value="<?php echo htmlspecialchars($edit ? $user['username'] : '', ENT_QUOTES, 'UTF-8'); ?>" placeholder="Username" class="form-control" required="required" id = "username" >
    </div>

    <div class="form-group">
        <label for="email">Email *</label>
        <input type="text" name="email" value="<?php echo htmlspecialchars($edit ? $user['email'] : '', ENT_QUOTES, 'UTF-8'); ?>" placeholder="Email" class="form-control" required="required" id="email">
    </div>

    <div class="form-group">
        <label for="ign">IGN *</label>
          <input type="text" name="ign" value="<?php echo htmlspecialchars($edit ? $user['IGN'] : '', ENT_QUOTES, 'UTF-8'); ?>" placeholder="IGN" class="form-control" required="required" id="ign">
    </div>

    <div class="form-group">
        <label for="name">Name *</label>
          <input type="text" name="name" value="<?php echo htmlspecialchars($edit ? $user['name'] : '', ENT_QUOTES, 'UTF-8'); ?>" placeholder="Name" class="form-control" required="required" id="name">
    </div>

    <div class="form-group text-center">
        <label></label>
        <button type="submit" class="btn btn-warning" >Save <span class="glyphicon glyphicon-send"></span></button>
    </div>
</fieldset>
