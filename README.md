# Mormon Missionaries

With the technology of the twenty-first century, it's time to build an open source database that serves historians and other researchers in their study of primary source artifacts and documents. This project seeks to combine the advantages of document-based databasing, software versioning, and open source collaborative repositories to provide a scalable, searchable, and comprehensive record of the known body of Mormon missionary primary sources. It takes the history of Mormon mission as its unifying topic, and will include a running collection of citations and meta-information for individual works and artifacts relating to this history. The principal discipline around which this collection will be oriented is history, though other disciplines ought to benefit from the arrangement of these citations and whatever additional commentary that will be included with them. This collection will rely on guiding conventions to maintain the data and allow them to scale with new and changing methods of cataloging, systematizing, indexing, and searching. Contributors and users will need to be proficient in these conventions, which are outlined below.

## Using This Database

The easiest way to use this database is to download it using the GitHub interface. Under the "Downlaods" tab, you can download a zip or tar.gz file containing all the files in this database. Any text editor will open these files for viewing or editing. Because this database is document-oriented, any number of desktop search tools can index and query this collection. On a Mac, simply open the parent `Mormon-Missionaries` folder in a new Finder window and use the Spotlight search tool to limit the query to this folder. This technique is effective at providing comprehensive keyword search results without learning any query languages or interacting with a web page or other database browser. Other desktop search tools that work much the same way as Spotlight for the Windows platform include Google's Desktop Search, Windows 7's built-in desktop search tool, and others.

## Contributing to This Database

You can contribute to this database by "forking" this repository. The simplest way to do this is on the Mac platform. On this page there is the "Clone in Mac" button. By clicking this, you will be taken to a page on GitHub where you can download their GitHub for Mac application. This application greatly simplifies the editing process. Because this database functions as a code repository, everything by every user is essentially saved to this repository without anything being lost. Every change that is "committed" is preserved. When you "clone" the repository on your computer, it will download the files to your desktop. If you make any changes to these files in the text editor of your choice, once you revisit GitHub for Mac, any changes you have made will be noted and you will have the ability to commit those differences to the repository. Your changes will not only be saved for your own use, but will be made available to the community of users that all contribute to this project. That's the magic of the open-source versioning model of collaboration. PC users can also contribute, but the process runs a little differently. Free resources are available at https://github.com/training/free and http://help.github.com/.

## Collection Structure

This database is based on the document-oriented storage model (as opposed to the record-oriented or relational-oriented models). This means that the data is stored following a document structure: each item or record in the database is represented by a file housed within a folder, just like on a desktop platform. To facilitate traversing the collection, this project adopts a file structure that behaves as a governing framework to the data store. The filename for each document/record behaves as a unique identifier to prevent data convergence or redundancy.

The filename/unique identifier follows a naming convention. As each file represents a single individual, the filename will reflect identifers unique to that individual: full name and birth and date years. Where a birth or death year is not known, the `?` character will serve as a circa indicator. The filename is delimited by dashes and underscores according to pattern explained below.

Each file in this database conforms to the JSON format. As JSON files, they use the `.json` file extension.

## Folder and File Naming Conventions

To ensure that each document in the database represents an actual source, the following naming conventions are adhered to when committing records to the database. These naming conventions also allow for software indexers to be applied for abstracted searching and ordering of the database contents.

These records are primarily ordered by the last name of the person, followed by the first name and any other additional names. The birth and death years follow. For example:

`McLellin-William-Earl_1806-1883.json`

This file corresponds to William E. McLellin, a missionary who recorded perhaps the most detail of 1830s Mormon missionary work. His name is capitalized following the Chicago headline style and is separated by dashes. The name and birth/death years are separated by an underscore.

## Indexing Syntax

Additional data is provided inside each document file in the form of a JSON-formatted string. JSON is a robust yet simple format for encoding data. The basic JSON pattern is the `key` and `value` association. For example:

`"name": "William McLellin"`

The key in this example is `"name"` and the value is `"William McLellin"`. Multiple keys and multiple values are stored using arrays and objects. Arrays are used to assign multiple values to a single key. Objects are used to define multiple keys. Arrays are encased in brackets. Objects are encased in curly braces, like so:

    {
    	"name": { "last": "McLellin", "first": "William", "middle": "Earl" },
    	"family": [
    		{ "wife": { "married": "McLellin", "first": "Cinthia", "middle": "Ann" } },
    		{ "child": { "last": "McLellin", "first": "Charles", "middle": "William" } }
    	]
    }

Here, a single object represents the whole record, which is why the document begins and ends with opening and closing curly braces, respectively. The first key in this object is `"name"`, to which is associated another object which contains multiple keys: `"last"`, `"first"`, and `"middle"`. Another key appears here after `"name"`, so the `"name"` object ends with a comma to separate it from the next key. The second key is `"family"` to which is assigned an array. The array begins with an opening bracket, and each multiple value in this array will be separated by a comma. In this example, each value in the array is represented by an object that corresponds with each member of McLellin's family.

JSON allows for nested associations of keys and values, which is a major reason why it can scale so effectively with changing databases. Any key may have an array or object associated with it, and any array or object can contain any number of values.

For more examples of JSON in action, visit http://www.json.org/example.html.

## Indexing Schema

The contents of each record file contain cataloging and researching information relating to the source. The following list of fields are used across the database. Additional keys may be used and not all keys will be present in each document. This facilitates scaling the data as the repository grows and the variability between sources increases. The document-oriented structure of this system encourages providing as much data as desired, but each data value must have a key. The Indexing Syntax section describes how the information is to be encoded to allow for easy parsing by search indexers.

    /* Primary Information */
    "name": [object]
    	"last": [string]
    	"first": [string]
    	"middle": [string]
    	"married": [string]
    	"suffix": [string]
    	"additional": [array]
    	"patronymic": [string]
    	"matronymic": [string]
    	"maternalSurname": [string]
    	"paternalSurname": [string]
    
    "aliases": [array] [string or name object]
    
    "birth": [object]
    	"year": [integer]
    	"month": [integer]
    	"day": [integer]
    
    "death": [object]
    	[date format; see "birth"]
    
    "family": [array]
    	"father": [object]
    	"mother": [object]
    	"sibling": [object]
    	"spouse": [object]
    	"child": [object]
    	
    	/* Families are confined to the immediate, nuclear family of the given person. Where the missionary worked 
    	directly with other extended family members, they may be listed here, but this database does not intend to 
    	contain a running genealogical pedigree of the whole family. */
    	
    	"grandfather": [object]
    	"grandmother": [object]
    	"aunt": [object]
    	"uncle": [object]
    	"cousin": [object]
    	"brotherInLaw": [object]
    	"sisterInLaw": [object]
    	"motherInLaw": [object]
    	"fatherInLaw": [object]
    	"nephew": [object]
    	"niece": [object]
    
    "missions": [array]
    	"start": [date]
    	"end": [date]
    	"companions": [array] [name keys and values]
    	"locations": [array]
    	"sources": [array] //documents or artifacts specific to a given mission; other documents are listed in a separate `sources` object
    	"recipients": [array]
    	"roles": [array] //if the missionary participated in a specific role, these are noted here - possible values are:
    		"President", "Counselor", "Apostle", "Seventy", "Elder", "Priest", "Teacher", "Deacon"
    
    "sources": [array]
    	"author": [name]
    	"title": [string]
    	"location": [object]
    		"city": [string]
    		"state": [string]
    	"date": [object] [date]
    	"venues": [array]
    		/* Contains known archives or libraries where this source is available */
    	
    	

### Syntax Example

    {
    	"name": {
    		"last": "Smith",
    		"first": "Samuel",
    		"middle": "Harrison"
    	},
    	"birth": {
    		"year": 1808,
    		"month": 3,
    		"day": 13
    	},
    	"death": {
    		"year": 1844,
    		"month": 7,
    		"day": 30
    	},
    	"family": [
    		{ "father": { "last": "Smith", "first": "Joseph", "suffix": "Sr." } },
    		{ "mother": { "last": "Mack", "first": "Lucy", "married": "Smith" } },
    		{ "spouse": { "last": "Bailey", "first": "Mary", "married": "Smith" } },
    		{ "spouse": { "last": "Clark", "first": "Levira", "married": "Smith" } },
    		{ "child": { "last": "Smith", "first": "Lucy" } },
    		{ "child": { "last": "Smith", "first": "Susannah" } },
    		{ "child": { "last": "Smith", "first": "Mary" } },
    		{ "child": { "last": "Smith", "first": "Samuel", "middle": "Harrison" } },
    		{ "child": { "last": "Smith", "first": "Lovisa", "middle": "C." } },
    		{ "child": { "last": "Smith", "first": "Lucy", "middle": "J. C." } },
    		{ "child": { "last": "Smith", "first": "Levira", "middle": "Annette" } },
    	],
    	"missions": [
    		{
    			"start": { "year": 1830, "month": 6, "day": 30 },
    			"end": { "year": 1830, "month": 8 },
    			"locations": [
    				{ "city": "Bloomfield", "state": "New York" },
    				{ "city": "Livonia", "state": "New York" }
    			],
    			"recipients": [
    				{ "last": "Greene", "first": "John", "middle": "Portineus" },
    				{ "last": "Beaman", "first": "Esquire" }
    			],
    			"sources": [
    				{
    					"author": { "last": "Mack", "first": "Lucy", "married": "Smith" },
    					"title": "Biographical sketches of Joseph Smith the prophet, and his progenitors for many generations",
    					"location": { "city": "Liverpool", "country": "Great Britain" },
    					"publisher": "S. W. Richards",
    					"date": { "year": 1853 }
    				}
    			]
    		},
    		{
    			"start": { "year": 1831, "month": 1, "day": 2 },
    			"end": { "year": 1831, "month": 2, "day": 27 },
    			"locations": [
    				{ "state": "New York" },
    				{ "state": "Ohio" }
    			],
    			"companions": [ { "last": "Pratt", "first": "Orson", "id": "Pratt-Orson_1811-1881" } ],
    			"sources": [
    				{
    					"author": { "last": "Pratt", "first": "Orson", "id": "Pratt-Orson_1811-1881" },
    					"title": "History of Orson Pratt",
    					"newspaper": "Millennial Star",
    					"volume": 26,
    					"pages": 55,
    					"date": { "year": 1863 }
    				},
    				{
    					"author": { "last": "Mack", "first": "Lucy", "married": "Smith" },
    					"title": "Biographical sketches of Joseph Smith the prophet, and his progenitors for many generations",
    					"location": { "city": "Liverpool", "country": "Great Britain" },
    					"publisher": "S. W. Richards",
    					"date": { "year": 1853 }
    				}
    			]
    		},
    		{
    			"start": { "year": 1832, "month": 1, "day": 25 },
    			"end": { "year": 1832, "month": 12, "day": 22 },
    			"locations": [
    				{ "state": "Ohio" },
    				{ "state": "New York" },
    				{ "state": "Pennsylvania" },
    				{ "state": "Connecticut" },
    				{ "state": "Rhode Island" },
    				{ "state": "Massachusetts" },
    				{ "state": "Maine" }
    			],
    			"companions": [ { "last": "Hyde", "first": "Orson", "id": "Hyde-Orson_1805-1878" } ]
    		}
    	],
    	"sources": []
    }
