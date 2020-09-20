<fieldset>
    <div class="form-group">
        <label for="title">Title *</label>
          <input type="text" name="title" value="<?php echo htmlspecialchars($edit ? $new['title'] : '', ENT_QUOTES, 'UTF-8'); ?>" placeholder="Title" class="form-control" required="required" id = "title" >
    </div>

    <div class="form-group">
        <label for="email">Writer *</label>
        <input type="text" name="writer" value="<?php echo htmlspecialchars($edit ? $new['writer'] : '', ENT_QUOTES, 'UTF-8'); ?>" placeholder="Writer" class="form-control" required="required" id="writer">
    </div>

    <div class="form-group">
        <label for="ign">URL *</label>
          <input type="text" name="url" value="<?php echo htmlspecialchars($edit ? $new['url'] : '', ENT_QUOTES, 'UTF-8'); ?>" placeholder="URL" class="form-control" required="required" id="url">
    </div>

    <div class="form-group">
        <label for="name">ImageURL *</label>
          <input type="text" name="imageUrl" value="<?php echo htmlspecialchars($edit ? $new['imageUrl'] : '', ENT_QUOTES, 'UTF-8'); ?>" placeholder="ImageURL" class="form-control" required="required" id="imageUrl">
    </div>

    <div class="form-group">
        <label for="address">Details *</label>
          <textarea name="details" placeholder="Details" class="form-control" id="details"><?php echo htmlspecialchars(($edit) ? $new['details'] : '', ENT_QUOTES, 'UTF-8'); ?></textarea>
    </div>

    <div class="form-group text-center">
        <label></label>
        <button type="submit" class="btn btn-warning" >Save <span class="glyphicon glyphicon-send"></span></button>
    </div>
</fieldset>
