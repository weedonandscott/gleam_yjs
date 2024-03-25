import gleam/dict.{type Dict}
import gleam/option.{type Option}
import ygleam/y.{type YType}

// pub type DeleteItem
// 
// @external(javascript, "../yUndoManager.mjs", "deleteItemClock")
// pub fn delete_item_clock(delete_set: DeleteSet) -> Float
// 
// @external(javascript, "../yUndoManager.mjs", "deleteItemLen")
// pub fn delete_item_len(delete_set: DeleteSet) -> Float
// 
// pub type DeleteSet
// 
// @external(javascript, "../yUndoManager.mjs", "deleteSetClients")
// pub fn delete_set_clients(delete_set: DeleteSet) -> Dict(Int, List(DeleteItem))
// 
// pub type StackItem
// 
// @external(javascript, "../yUndoManager.mjs", "stackItemInsertions")
// pub fn stack_item_insertions(stack_item: StackItem) -> Option(DeleteSet)
// 
// @external(javascript, "../yUndoManager.mjs", "stackItemDeletions")
// pub fn stack_item_deletions(stack_item: StackItem) -> Option(DeleteSet)
// 
// @external(javascript, "../yUndoManager.mjs", "stackItemMeta")
// pub fn stack_item_meta(stack_item: StackItem) -> 

pub type YUndoManager

pub type UndoType {
  Undo
  Redo
}

@external(javascript, "../yUndoManager.mjs", "do_new")
pub fn new(scope: List(YType)) -> YUndoManager

@external(javascript, "../yUndoManager.mjs", "undo")
pub fn undo(undo_manager: YUndoManager) -> Nil

@external(javascript, "../yUndoManager.mjs", "redo")
pub fn redo(undo_manager: YUndoManager) -> Nil

@external(javascript, "../yUndoManager.mjs", "stopCapturing")
pub fn stop_capturing(undo_manager: YUndoManager) -> Nil
// 
// @external(javascript, "../yUndoManager.mjs", "onStackItemAdded")
// pub fn on_stack_item_added(
//   undo_manager: YUndoManager,
//   cb: fn(StackItem, UndoType) -> Nil,
// ) -> Nil
// 
// @external(javascript, "../yUndoManager.mjs", "onStackItemUpdated")
// pub fn on_stack_item_updated(
//   undo_manager: YUndoManager,
//   cb: fn(StackItem, UndoType) -> Nil,
// ) -> Nil
// 
// @external(javascript, "../yUndoManager.mjs", "onStackItemPopped")
// pub fn on_stack_item_popped(
//   undo_manager: YUndoManager,
//   cb: fn(StackItem, UndoType) -> Nil,
// ) -> Nil
// 
// @external(javascript, "../yUndoManager.mjs", "onStackCleared")
// pub fn on_stack_cleared(
//   undo_manager: YUndoManager,
//   cb: fn(Bool, Bool) -> Nil,
// ) -> Nil
