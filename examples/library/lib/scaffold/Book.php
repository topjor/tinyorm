<?php
/**
 * auto generated by tinyorm 2016-03-07 19:52:20
 * @property int $id
 * @property string $title
 */
namespace library\scaffold;
class Book extends \tinyorm\Entity {
    protected $sourceName = 'book';
    protected $pkName = 'id';
    protected $autoUpdatedCols = array ();
    function getDefaults() {
        return [
            'id' => NULL,
            'title' => NULL,
        ];
    }
}
