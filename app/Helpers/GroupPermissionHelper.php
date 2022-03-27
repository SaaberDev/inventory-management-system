<?php

    /**
     * Returns group name in capitalize word.
     *
     * @param $arg
     * @return string
     */
    function permissionGroupName($arg): string
    {
        return ucfirst(str_replace('_', ' ', $arg->pluck('group_name')->first()));
    }

    /**
     * Group will be checked if group has all permission checked.
     *
     * @param $assignedArg
     * @param null $groupArg
     * @param string|null $groupName
     * @param array $merge
     * @param string $type
     * @return mixed
     */
    function checkIfGroupHasPermission($assignedArg, $groupArg = null, string $groupName = null, $merge = [], string $type = 'group')
    {
        if ($type == 'group') {
            $arg1 = $assignedArg->permissions->where('group_name', '=', $groupName)->pluck('id')->toArray();
            $arg2 = $groupArg->pluck('id')->toArray();

            return !($arg1 != $arg2);
        } elseif ($type == 'all') {
            $arg1 = $assignedArg->permissions->pluck('id')->toArray();
            $merged = [];
            foreach ($merge as $item) {
                $merged = $item->pluck('id')->toArray();
            }
            $arg2 = Arr::sortRecursive($merged);

            return !($arg1 != $arg2);
        }
    }
