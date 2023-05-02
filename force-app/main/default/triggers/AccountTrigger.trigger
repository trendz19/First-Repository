trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) 
{
    
        switch on Trigger.operationType {
            when BEFORE_INSERT {
                AccountTriggerHandler.beforeInsert(Trigger.new);
            }
            when BEFORE_UPDATE {
                //AccountTriggerHandler.beforeUpdate(Trigger.new,Trigger.old,Trigger.oldMap,Trigger.newMap);
                AccountTriggerHandler.beforeUpdate(Trigger.new,Trigger.oldMap);
                AccountTriggerHandler.beforeInsert(Trigger.new);
            }
            when BEFORE_DELETE {
                // handler.beforeDelete(Trigger.old, Trigger.oldMap);
            }
            when AFTER_INSERT {
                AccountTriggerHandler.afterInsert(Trigger.newMap);
            }
            when AFTER_UPDATE {
                // handler.afterUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);
            }
            when AFTER_DELETE {
                // handler.afterDelete(Trigger.old, Trigger.oldMap);
            }
            when AFTER_UNDELETE {
                // handler.afterUndelete(Trigger.new, Trigger.newMap);
            }
        }
}